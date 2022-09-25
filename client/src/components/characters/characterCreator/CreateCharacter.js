import { useContext, useState } from 'react'
import { Outlet, useNavigate } from 'react-router-dom'
import { FormGrid } from '../../styles/Grids.styles'
import { CharacterContext, UserContext } from '../../tools/Hooks'
import { blankCharacter } from '../../tools/miscData'

const CreateCharacter = () => {

     const navigate = useNavigate()
     const {user} = useContext(UserContext)
     const {setCharacter} = useContext(CharacterContext)
     const [newCharacter, setNewCharacter] = useState(blankCharacter)
     const [amount, setAmount] = useState(0)
     const [skills, setSkills] = useState([])
     const [skillOne, setSkillOne] = useState('')
     const [skillTwo, setSkillTwo] = useState('')
     const [skillThree, setSkillThree] = useState('')
     const [skillFour, setSkillFour] = useState('')

     const resetSkills = () => {setSkillOne(''); setSkillTwo(''); setSkillThree(''); setSkillFour('');}

     const handleInput = e => {
          const formName = e.target.name
          let formValue = e.target.value
          setNewCharacter({
              ...newCharacter,
              [formName]: formValue
          })
     }

     const handleClassChange = e => {
          resetSkills()
          setNewCharacter({
               ...newCharacter,
               dnd_class_id: e.target.value
          })
          fetch(`/dnd_classes/${e.target.value}/proficiencies`)
               .then(r=>{
                    if (r.ok) {
                         r.json().then(data=>{setSkills(data[0].slice(0, (data[0].length - 3))); setAmount(data[1])})
                    } else {
                         r.json().then(errors=>console.log(errors))
                    }
               })
     }

     const handleStats = e => {
          const formName = e.target.name
          let formValue = parseInt(e.target.value)
          setNewCharacter({
               ...newCharacter,
               [formName]: formValue
          })
     }

     const handleSkill = e => {
          const formName = e.target.name
          let formValue = e.target.value
          switch (formName) {
               case 'skillOne':
                    setSkillOne(formValue)
                    break;
               case 'skillTwo':
                    setSkillTwo(formValue)
                    break;
               case 'skillThree':
                    setSkillThree(formValue)
                    break;
               case 'skillFour':
                    setSkillFour(formValue)
                    break;
               default:
                    resetSkills()
          }
     }

     const handleSubmit = e => {
          e.preventDefault()
          let newSkills = [skillOne, skillTwo, skillThree, skillFour].filter(skill => skill !== '')
          fetch(`/characters`, {
               method: "POST",
               headers: {"Content-Type": "application/json"},
               body: JSON.stringify({
                    ...newCharacter,
                    user_id: user.id,
                    proficiency_choices: newSkills
               })
          }).then(r=>{
               if (r.ok) {
                    r.json().then(data=>{
                         setCharacter(data);
                         navigate(`/users/${user.username}/characters/${data.id}`)
                    })
               } else {
                    r.json().then(errors=>console.log(errors))
               }
          })
     }

     const formHandlers = {handleInput, handleClassChange, handleStats, handleSkill, handleSubmit}

     const formData = {skills, skillOne, skillTwo, skillThree, skillFour, amount}

     return (
          <FormGrid>
               <h1>New Character</h1>
               <Outlet context={[formHandlers, formData, newCharacter]}/>
          </FormGrid>
     )

}

export default CreateCharacter