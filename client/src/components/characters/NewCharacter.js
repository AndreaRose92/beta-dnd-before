import React, { useContext, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { getRequest, postRequest } from '../tools/FetchTypes'
import { CharacterContext, UserContext } from '../tools/Hooks'

const NewCharacter = ({updateCharacters}) => {

    const navigate = useNavigate()
    const {user} = useContext(UserContext)
    const {character, setCharacter} = useContext(CharacterContext)
    const [skills, setSkills] = useState([{name: ''}])
    const [charSkills, setCharSkills] = useState([])
    const [newCharacter, setNewCharacter] = useState({
        name: '',
        level: 0,
        user_id: user.id,
        dnd_class_id: 0,
        race_id: 0,
        strength: 0,
        dexterity: 0,
        constitution: 0,
        intelligence: 0,
        wisdom: 0,
        charisma: 0,
        hp: 0,
        current_hp: 0
    }) 


    const [form, setForm] = useState('default')

    const handleInput = e => {
        const formName = e.target.name
        let formValue = e.target.value
        setNewCharacter({
            ...newCharacter,
            [formName]: formValue
        })
    }

    const submitCharacter = e => {
        e.preventDefault()
        setNewCharacter(newCharacter => ({
            ...newCharacter,
            user_id: user.id
        }))
        postRequest('/characters', newCharacter, setNewCharacter)
        setCharacter(newCharacter)
        updateCharacters(newCharacter)
        charSkills.forEach(skill => postRequest(`/char_skills`, {character_id: character.id, proficiency: skill}, console.log))
        navigate(`/users/${user.username}`)
    }

    const fetchSkills = () => {
        getRequest(`/dnd_classes/${newCharacter.dnd_class_id}/proficiencies`, setSkills)
        setForm("abilities")
    }

    const handleSkill = e => {
        if (e.target.checked === true) {
            setCharSkills(skills => [...skills, e.target.name])
        } else {
            setCharSkills(skills => skills.filter(skill => skill !== e.target.name))
        }
    }

    const renderSkills = skills.slice(0, skills.length - 2).map(skill=>{
        return (
            <li key={skill.id}><label htmlFor={skill.name}>{skill.name}
                <input type='checkbox' name={skill.name} defaultChecked={charSkills.includes(skill.name)} onClick={handleSkill}/>
            </label></li>
        )
    })

    const pageOne = 
    <form>
        <h2>Basic Information</h2>
        <input type='text' name='name' placeholder='name' value={newCharacter.name} onChange={handleInput} /><br/>
        <input type='number' name='level' placeholder='level' value={newCharacter.level} onChange={handleInput}/><br/>
        <select defaultValue={newCharacter.dnd_class_id} onChange={handleInput} name='dnd_class_id'>
            <option value={0}>Class</option>
            <option value={1}>Barbarian</option>
            <option value={2}>Bard</option>
            <option value={3}>Cleric</option>
            <option value={4}>Druid</option>
            <option value={5}>Fighter</option>
            <option value={6}>Monk</option>
            <option value={7}>Paladin</option>
            <option value={8}>Ranger</option>
            <option value={9}>Rogue</option>
            <option value={10}>Sorcerer</option>
            <option value={11}>Warlock</option>
            <option value={12}>Wizard</option>
        </select><br/>
        <select defaultValue={newCharacter.race_id} onChange={handleInput} name='race_id'>
            <option value={0}>Race</option>
            <option value={1}>Dragonborn</option>
            <option value={2}>Dwarf</option>
            <option value={3}>Elf</option>
            <option value={4}>Gnome</option>
            <option value={5}>Half-Elf</option>
            <option value={6}>Half-Orc</option>
            <option value={7}>Halfling</option>
            <option value={8}>Human</option>
            <option value={9}>Tiefling</option>
        </select><br/>
        <button onClick={()=>fetchSkills()}>Next</button>
    </form>

    const pageTwo = 
    <form>
        <h2>Ability Scores</h2>
        <label htmlFor='strength'>Strength: </label>
        <input value={newCharacter.strength} onChange={handleInput} type='number' name='strength'/><br/>
        <label htmlFor='dexterity'>Dexterity: </label>
        <input value={newCharacter.dexterity} onChange={handleInput} type='number' name='dexterity'/><br/>
        <label htmlFor='constitution'>Constitution: </label>
        <input value={newCharacter.constitution} onChange={handleInput} type='number' name='constitution'/><br/>
        <label htmlFor='intelligence'>Intelligence: </label>
        <input value={newCharacter.intelligence} onChange={handleInput} type='number' name='intelligence'/><br/>
        <label htmlFor='wisdom'>Wisdom: </label>
        <input value={newCharacter.wisdom} onChange={handleInput} type='number' name='wisdom'/><br/>
        <label htmlFor='charisma'>Charisma: </label>
        <input value={newCharacter.charisma} onChange={handleInput} type='number' name='charisma'/><br/>
        <button onClick={()=>setForm("default")}>Back</button>
        <button onClick={()=>setForm("skills")}>Next</button>
    </form>

    const pageThree = 
    <form>
        <h2>Skill Proficiencies</h2>
        <h4>Class Options:</h4>
        <ul>{renderSkills}</ul>
        <button onClick={()=>setForm("abilities")}>Back</button>
        <button onClick={()=>setForm("submit")}>Next</button>
    </form>

    const lastPage = 
    <form onSubmit={submitCharacter} >
        <h2>Character Details</h2>
        <h3>{newCharacter.name}</h3>
        <h4>{newCharacter.race_id} {newCharacter.dnd_class_id}</h4>
        <ul>
            <li>Strength: {newCharacter.strength}</li>
            <li>Dexterity: {newCharacter.dexterity}</li>
            <li>Constitution: {newCharacter.constitution}</li>
            <li>Intelligence: {newCharacter.intelligence}</li>
            <li>Wisdom: {newCharacter.wisdom}</li>
            <li>Charisma: {newCharacter.charisma}</li>
        </ul>
        <ul>{charSkills.map(skill => <li key={skill}>{skill}</li>)}</ul>
        <button onClick={()=>setForm("skills")}>Back</button>
        <button type='submit'>Submit</button>
    </form>

    const renderForm = () => {
        if (form === "default") {
            return pageOne
        } else if (form === "abilities") {
            return pageTwo
        } else if (form === "skills") {
            return pageThree
        } else {
            return lastPage
        }
    }


  return (
    <div>
        <h1>New Character</h1>
        <div>
            {renderForm()}
        </div>
    </div>
  )
}

export default NewCharacter