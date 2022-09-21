import React, { useContext, useState } from 'react'
import { useNavigate } from 'react-router-dom'
import { postRequest } from '../tools/FetchTypes'
import { CharacterContext, UserContext } from '../tools/Hooks'

const NewCharacter = () => {

    const navigate = useNavigate()
    const {user} = useContext(UserContext)
    const {character, setCharacter} = useContext(CharacterContext)

    const [form, setForm] = useState('default')

    const handleInput = e => {
        const formName = e.target.name
        let formValue = e.target.value
        setCharacter({
            ...character,
            [formName]: formValue
        })
    }

    const submitCharacter = e => {
        e.preventDefault()
        setCharacter(character => ({
            ...character,
            user_id: user.id
        }))
        console.log(character)
        postRequest('/characters', character, setCharacter)
        // navigate(`/users/${user.username}`)
    }

    const pageOne = 
    <form>
        <h2>Basic Information</h2>
        <input type='text' name='name' placeholder='name' value={character.name} onChange={handleInput} /><br/>
        <input type='number' name='level' placeholder='level' value={character.level} onChange={handleInput}/><br/>
        <select onChange={handleInput} name='dnd_class_id'>
            <option value={null}>Class</option>
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
        <select onChange={handleInput} name='race_id'>
            <option value={null}>Race</option>
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
        <button onClick={()=>setForm("abilities")}>Next</button>
    </form>

    const pageTwo = 
    <form>
        <h2>Ability Scores</h2>
        <label htmlFor='strength'>Strength: </label>
        <input value={character.strength} onChange={handleInput} type='number' name='strength'/><br/>
        <label htmlFor='dexterity'>Dexterity: </label>
        <input value={character.dexterity} onChange={handleInput} type='number' name='dexterity'/><br/>
        <label htmlFor='constitution'>Constitution: </label>
        <input value={character.constitution} onChange={handleInput} type='number' name='constitution'/><br/>
        <label htmlFor='intelligence'>Intelligence: </label>
        <input value={character.intelligence} onChange={handleInput} type='number' name='intelligence'/><br/>
        <label htmlFor='wisdom'>Wisdom: </label>
        <input value={character.wisdom} onChange={handleInput} type='number' name='wisdom'/><br/>
        <label htmlFor='charisma'>Charisma: </label>
        <input value={character.charisma} onChange={handleInput} type='number' name='charisma'/><br/>
        <button onClick={()=>setForm("default")}>Back</button>
        <button onClick={()=>setForm("skills")}>Next</button>
    </form>

    const pageThree = 
    <form>
        <h2>Skill Proficiencies</h2>
        <h4>Class Options:</h4>
        <button onClick={()=>setForm("abilities")}>Back</button>
        <button onClick={()=>setForm("submit")}>Next</button>
    </form>

    const lastPage = 
    <form onSubmit={submitCharacter} >
        <h2>Character Details</h2>
        <h3>{character.name}</h3>
        <h4>{character.race_id} {character.dnd_class_id}</h4>
        <ul>
            <li>Strength: {character.strength}</li>
            <li>Dexterity: {character.dexterity}</li>
            <li>Constitution: {character.constitution}</li>
            <li>Intelligence: {character.intelligence}</li>
            <li>Wisdom: {character.wisdom}</li>
            <li>Charisma: {character.charisma}</li>
        </ul>
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