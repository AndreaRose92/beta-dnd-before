import { useState } from 'react'
import { Outlet } from 'react-router-dom'
import { FormGrid } from '../../styles/Grids.styles'
import { blankCharacter } from '../../tools/miscData'

const CreateCharacter = () => {
     
     const [newCharacter, setNewCharacter] = useState(blankCharacter)
     const [amount, setAmount] = useState(0)
     const [skills, setSkills] = useState([])
     const [skillOne, setSkillOne] = useState('')
     const [skillTwo, setSkillTwo] = useState('')
     const [skillThree, setSkillThree] = useState('')
     const [skillFour, setSkillFour] = useState('')
     const stats = newCharacter.stats

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
          let formValue = e.target.value
          setNewCharacter({
               ...newCharacter,
               stats: {
                    ...newCharacter.stats,
                    [formName]: formValue
               }
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

     const formHandlers = {handleInput, handleClassChange, handleStats, handleSkill}

     const formData = {stats, skills, skillOne, skillTwo, skillThree, skillFour, amount}

     return (
          <FormGrid>
               <h1>New Character</h1>
               <Outlet context={[formHandlers, formData, newCharacter]}/>
          </FormGrid>
     )

}

export default CreateCharacter