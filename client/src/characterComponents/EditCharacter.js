import { useContext, useEffect, useState } from "react"
import { EditForm, EditStatBox, EditWrapper, Error, StatForm } from "../styles"
import { CharacterContext, ErrorContext } from '../hookComponents'
import { useNavigate, useParams } from "react-router-dom"
import React from "react"

export const EditCharacter = () => {

  const navigate = useNavigate()
  const params = useParams()
  const {errors, setErrors} = useContext(ErrorContext)
  const {character, setCharacter} = useContext(CharacterContext)
  const [update, setUpdate] = useState({})
  const [stats, setStats] = useState([{name: '', value: 0, base_value: 0, modifier: 0}])
  const [newStats, setNewStats] = useState({})


  useEffect(()=>{
    fetch(`/characters/${params.id}`).then(r=>{
      if (r.ok) {
        r.json().then(data=>setCharacter(data)).then(()=>setStats(character.stats))
      } else {
        r.json().then(errors=>setErrors(errors))
      }
    })
  }, [character.stats, params.id, setCharacter, setErrors])

  const handleInput = e => {
    const formName = e.target.name
    let formValue = e.target.value
    setUpdate({
      ...update,
      [formName]: formValue
    })
  }

  const handleStats = e => {
    const formName = e.target.name
    let formValue = e.target.value
    setNewStats({
      ...newStats,
      [formName]: formValue
    })
  }

  const handleSubmit = e => {
    e.preventDefault()
    fetch(`/characters/${character.id}`,{
      method: "PATCH",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify(update)
    }).then(r=>{
      if (r.ok) {
        r.json().then(update=>{setCharacter(update); navigate(`/users/${params.username}/characters/${character.id}`)})
      } else {
        r.json().then(errors=>setErrors(errors))
      }
    })
  }

  const renderStats = stats ? stats.map(stat => {
    if (stat !== null) {
    return (
      <EditStatBox key={stat.name}>
        <div>
          <div><p>{stat.name}</p></div>
          <div className='mid'>
          <input type='number' name={stat.name} defaultValue={stat.base_value} onChange={e=>handleStats(e)}/>
          </div>
          <div className='bottom'><h4>{stat.value}</h4></div>
        </div>
      </EditStatBox>
    )} else {
      return null
    }
  }) : null

  if (!character) {
    return <h2>Loading...</h2>
  }

  return (
    <EditWrapper>
      <h2>Edit Character</h2>
      <EditForm onSubmit={handleSubmit} >
        <label htmlFor="name">Name: </label>
        <input type='text' name='name' defaultValue={character.name} onChange={e=>handleInput(e)}/><br/>
        <label htmlFor="level">Level: </label>
        <input type='number' name='level' defaultValue={character.level} onChange={e=>handleInput(e)}/><br/>
        <label htmlFor="dnd_class_id">Class: </label>
        <select name='dnd_class_id'  onChange={e=>handleInput(e)}>
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
        <label htmlFor="race_id">Race: </label>
        <select name='race_id' onChange={e=>handleInput(e)}>
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
        <StatForm>{character ? renderStats : null}</StatForm>
        <button type='submit'>Submit</button>
        {errors ? errors.map(err=>(<Error key={err}>{err}</Error>)): null}
      </EditForm>  
    </EditWrapper>
  )
}