import { useContext, useState } from 'react'
import { Outlet, useNavigate } from 'react-router-dom'
import { FormGrid } from '../../styles'
import { ErrorContext, UserContext } from '../../hookComponents'
import { CharacterFormButtons } from '../index'

export const CreateCharacter = () => {

     const navigate = useNavigate()
     const {errors, setErrors} = useContext(ErrorContext)
     const {user} = useContext(UserContext)
     const [returnData, setReturnData] = useState(null)
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
     const [cantripChoices, setCantripChoices] = useState([])
     const newCharacter = {...basics, ...stats, skill_choices: [...skillChoices], spell_choices: [...spellChoices, ...cantripChoices]}

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
                         [formName]: formValue
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
               case "0":
                    if (cantripChoices.includes(formValue)) {
                         setCantripChoices(cantripChoices.filter(cantrip => cantrip !== formValue))
                    } else {
                         setCantripChoices(cantrips => [...cantrips, formValue])
                    }
                    break;
               case '1':
               case '2':
               case '3':
               case '4':
               case '5':
               case '6':
               case '7':
               case '8':
               case '9':
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

     const handlePageSubmit = e => {
          e.preventDefault()
          if (returnData === null) {
               fetch('/characters', {
                    method: "POST",
                    headers: {"Content-Type": "application/json"},
                    body: JSON.stringify(basics)
               }).then(r=>{
                    if (r.ok) {
                         r.json().then(data=>{setReturnData(data); setErrors(null); navigate(`./${e.target.value}`)})
                    } else {
                         r.json().then(errors=>setErrors(errors))
                    }
               })
          } else {
               setErrors(null)
               navigate(`./${e.target.value}`)
          }
     }

     const handleFullSubmit = e => {
          e.preventDefault()
          console.log(newCharacter)
          fetch(`/characters/${returnData.id}/finalize`, {
               method: "POST",
               headers: {"Content-Type": "application/json"},
               body: JSON.stringify(newCharacter)}).then(r=>{
               if (r.ok) {
                    r.json().then(data=>navigate(`/users/${user.username}/characters/${data.id}`))
               } else {
                    r.json().then(error=>setErrors(error.errors))
               }
          })
     }

     return (
          <FormGrid>
               <h1>New Character</h1>
               <Outlet context={{handleInput, handlePageSubmit, handleFullSubmit, basics, stats, returnData, skillChoices, cantripChoices, spellChoices}}/>
               <CharacterFormButtons handlePage={handlePageSubmit} errors={errors ? errors.errors : null}/>
         </FormGrid>
     )

}