import { useContext, useState } from 'react'
import { Outlet, useNavigate } from 'react-router-dom'
import { Error, FormGrid } from '../../styles'
import { ErrorContext, UserContext } from '../../hookComponents'

export const CreateCharacter = () => {

     const navigate = useNavigate()
     const {errors, setErrors} = useContext(ErrorContext)
     const {user} = useContext(UserContext)
     const [returnData, setReturnData] = useState({id: 0})
     const [basics, setBasics] = useState({
          name: '',
          dnd_class: '',
          race: '',
          level: 0
     })
     const [stats, setStats] = useState({
          strength: 0,
          dexterity: 0,
          constitution: 0,
          intelligence: 0,
          wisdom: 0,
          charisma: 0
     })
     const [skillChoices, setSkillChoices] = useState([])
     const [spellChoices, setSpellChoices] = useState([])
     const newCharacter = {basics, stats, skillChoices, spellChoices}

     const handleInput = e => {
          const formName = e.target.name
          let formValue = e.target.value
          switch (formName) {
               case "name":
               case "dnd_class":
               case "race":
                    setBasics({
                         ...basics,
                         [formName]: formValue
                    })
                    break;
               case "level":
                    setBasics({
                         ...basics,
                         [formName]: parseInt(formValue)
                    })
                    break;
               case "strength":
               case "dexterity":
               case "constitution":
               case "intelligence":
               case "wisdom":
               case "charisma":
                    setStats({
                         ...stats,
                         [formName]: parseInt(formValue)
                    })
                    break;
               case 'skills':
                    if (skillChoices.includes(formValue)) {
                         setSkillChoices(skillChoices.filter(skill => skill !== formValue))
                    } else {
                         setSkillChoices(skills=>[...skills, formValue])
                    }
                    break;
               case "spellChoices":
                    if (spellChoices.includes(formValue)) {
                         setSpellChoices(spellChoices.filter(spell => spell !== formValue))
                    } else {
                         setSpellChoices(spells => [...spells, formValue])
                    }
                    break;
               default:
                    return null
          }
     }

     const handlePageSubmit = (e, nextPage) => {
          e.preventDefault()
          if (e.target[0].name === 'name') {
               fetch('/characters', {
                    method: "POST",
                    headers: {"Content-Type": "application/json"},
                    body: JSON.stringify(basics)
               }).then(r=>{
                    if (r.ok) {
                         r.json().then(data=>{setReturnData(data); navigate(`./${nextPage}`)})
                    } else {
                         r.json().then(errors=>console.log(errors))
                    }
               })
          } else {
               navigate(`./${nextPage}`)
          }
     }

     const handleFullSubmit = e => {
          e.preventDefault()
          fetch(`/characters/${returnData.id}/finalize`, {
               method: "POST",
               headers: {"Content-Type": "application/json"},
               body: JSON.stringify(newCharacter).then(r=>{
                    if (r.ok) {
                         r.json().then(data=>navigate(`/users/${user.username}/characters/${data.id}`))
                    } else {
                         r.json().then(error=>setErrors(error.errors))
                    }
               })
          })
     }

     const formHandlers = {handleInput, handlePageSubmit, handleFullSubmit}

     const formData = {basics, stats, skillChoices, spellChoices, returnData}

     return (
          <FormGrid>
               <h1>New Character</h1>
               {errors ? errors.map(err => (
                    <Error key={err}>{err}</Error>
               )) : null}
               <Outlet context={[formHandlers, formData]}/>
\          </FormGrid>
     )

}