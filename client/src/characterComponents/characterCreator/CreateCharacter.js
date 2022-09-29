import { useContext, useState } from 'react'
import { Outlet, useNavigate } from 'react-router-dom'
import { FormGrid } from '../../styles'
import { CharacterContext, UserContext, blankCharacter, ErrorContext } from '../../hookComponents'

export const CreateCharacter = () => {

     const navigate = useNavigate()
     const {user} = useContext(UserContext)
     const {setCharacter} = useContext(CharacterContext)
     const {errors, setErrors} = useContext(ErrorContext)
     const [newCharacter, setNewCharacter] = useState(blankCharacter)
     // const [availableSpells, setAvailableSpells] = useState({})
     // const [spellcastingLevel, setSpellcastingLevel] = useState({})
     // const [selectedSpells, setSelectedSpells] = useState([])
     // const [maxSpellLevel, setMaxSpellLevel] = useState(0)
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
               dnd_class: e.target.value
          })
          fetch(`/dnd_classes/${e.target.value}/proficiencies`).then(r=>{
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
          createDndClass()
          // .then(r=>{
          //      if (r.ok) {
          //           r.json().then(()=>createRace()).then(r=>{
          //                if (r.ok) {
          //                     r.json().then(()=>postCharacter())
          //                } else {
          //                     r.json().then(errors=>setErrors(errors))         
          //                }
          //           })
          //      } else {
          //           r.json().then(errors=>setErrors(errors))
          //      }
          // })
     }

     const postCharacter = () => {
          let newSkills = [skillOne, skillTwo, skillThree, skillFour].filter(skill => skill !== '')
          fetch(`/characters`, {
               method: "POST",
               headers: {"Content-Type": "application/json"},
               body: JSON.stringify({
                    ...newCharacter,
                    proficiency_choices: newSkills
               })
          }).then(r=>{
               if (r.ok) {
                    r.json().then(data=>{
                         setCharacter(data)
                         navigate(`/users/${user.username}/characters/${data.id}`)
                    }).then(()=>{fetch(`/character_builders`, {method: "DELETE"})})
               } else {
                    r.json().then(errors=>setErrors(errors.errors))
               }
          })
     }
     const createRace = () => {
          fetch(`/races/${newCharacter.race}`, {method: "POST"})
               .then(r=>{if (r.ok) {
                    r.json().then(()=>postCharacter())
               } else {
                    r.json().then(errors=>setErrors(errors.errors))
               }
          })
     }
     const createDndClass = () => {
          fetch(`/dnd_classes/${newCharacter.dnd_class}/${newCharacter.level}`, {method: "POST"})
               .then(r=>{ if (r.ok) {
                    r.json().then(()=>createRace())
               } else {
                    r.json().then(errors=>setErrors(errors.errors))
               }
          })
     }



     // const handleSubmit = e => {
     //      e.preventDefault()
     //      let newSkills = [skillOne, skillTwo, skillThree, skillFour].filter(skill => skill !== '')
     //      fetch(`/characters`, {
     //           method: "POST",
     //           headers: {"Content-Type": "application/json"},
     //           body: JSON.stringify({
     //                ...newCharacter,
     //                proficiency_choices: newSkills,
     //                starting_spells: selectedSpells
     //           })
     //      }).then(r=>{
     //           if (r.ok) {
     //                r.json().then(data=>{
     //                     setCharacter(data);
     //                     navigate(`/users/${user.username}/characters/${data.id}`)
     //                }).then(()=>{
     //                     fetch(`/character_builders`, {method: "DELETE"})
     //                })
     //           } else {
     //                r.json().then(errors=>setErrors(errors.errors));
     //           }
     //      })
     // }

     // const handleSpells = () => {
     //      if (spellcasterIDs.includes(newCharacter.dnd_class))
     //      fetch(`/character_builders`, {
     //           method: "POST",
     //           headers: {"Content-Type": "application/json"},
     //           body: JSON.stringify({
     //                level: parseInt(newCharacter.level),
     //                dnd_class_id: parseInt(newCharacter.dnd_class),
     //                race_id: parseInt(newCharacter.race)
     //           })
     //      }).then(r=>{
     //           if(r.ok) {
     //                r.json().then(data=>{
     //                     setAvailableSpells(data.available_spells)
     //                     setSpellcastingLevel(data.spellcasting_level)
     //                     setMaxSpellLevel(data.max_spell_level)
     //                })
     //           } else {
     //                r.json().then(errors=>setErrors([errors]))
     //           }
     //      })
     // }

     // const handleTest = e => {
     //      setAvailableSpells(e.available_spells)
     //      setSpellcastingLevel(e.spellcasting_level)
     //      setMaxSpellLevel(e.max_spell_level)
     // }

     // const handleSelect = e => {
          
     //      const formName = e.target.name
     //      let formValue = e.target.value

     //      if (selectedSpells.includes(formValue)) {
     //           setSelectedSpells(spells => spells.filter(spell => spell !== formValue))
     //      } else {
     //           setSelectedSpells(spells => [...spells, formValue])
     //      }
     // }

     const formHandlers = {handleInput, handleClassChange, handleStats, handleSkill, handleSubmit}

     const formData = {skills, skillOne, skillTwo, skillThree, skillFour, amount, errors}

     return (
          <FormGrid>
               <h1>New Character</h1>
               <Outlet context={[formHandlers, formData, newCharacter]}/>
               {/* <Outlet
                    handlerContext={formHandlers}
                    dataContext={formData}
                    charContext={newCharacter}
               /> */}
          </FormGrid>
     )

}