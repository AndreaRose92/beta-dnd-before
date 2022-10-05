import React, { useContext, useEffect, useState } from 'react'
import { useNavigate, useParams } from 'react-router-dom'
import { ErrorContext } from '../../hookComponents'
import { CharacterGrid, CharacterWrapper } from '../../styles'
import { EditHeader } from './EditHeader'
import { EditHP } from './EditHP'
import { EditSkills } from './EditSkills'
import { EditStats } from './EditStats'

export const EditCharacter = () => {
  
  const params = useParams()
  const navigate = useNavigate()
  const {errors, setErrors} = useContext(ErrorContext)
  const [character, setCharacter] = useState(null)
  const [level, setLevel] = useState(null)
  const [stats, setStats] = useState(null)
  const [hpParams, setHpParams] = useState(null)
  const [updateSkills, setUpdateSkills] = useState(null)
  let update = character ? {
    name: character.name,
    ...stats,
    level,
    skill_choices: updateSkills,
    ...hpParams
  } : null

  useEffect(()=>{
    fetch(`/characters/${params.id}`).then(r=>{
      if (r.ok) {
        r.json().then(data=>{
          setCharacter(data);
          setLevel(data.level)
          setStats({
            strength: data.stats[0].value,
            dexterity: data.stats[1].value,
            constitution: data.stats[2].value,
            intelligence: data.stats[3].value,
            wisdom: data.stats[4].value,
            charisma: data.stats[5].value
          });
          setUpdateSkills(data.skills.filter(skill => skill.is_proficient));
          setHpParams({
            max_hp: data.max_hp,
            hp_option: 'fixed',
            hp_values: []
          })
        });
      } else {
        r.json().then(errors=>setErrors(errors.errors))
      }
    })
  }, [params.id, setErrors])

  const handleStats = e => {
    const formName = e.target.name
    let formValue = parseInt(e.target.value)
    setStats({
      ...stats,
      [formName]: formValue
    })
  }

  const handleSkills = e => {
    let skill = character.skills.find(item => item.name === e.target.name)
    e.target.checked ? setUpdateSkills(skills => [...skills, skill]) : setUpdateSkills(updateSkills.filter(item => item !== skill))
  }

  const handleUpdate = e => {
    e.preventDefault()
    // console.log(update)
    fetch(`/characters/${character.id}`, {
      method: "PATCH",
      headers: {"Content-Type": "application/json"},
      body: JSON.stringify(update)
    }).then(r=>{
      if (r.ok) {
        r.json().then(()=>navigate('/'))
      } else {
        r.json().then(errors=>setErrors(errors.errors))
      }
    })
  }

  while (character === null) {return (<div><h3>Loading...</h3></div>)}

  return (
    <CharacterWrapper>
        <EditHeader name={character.name} dnd_class={character.dnd_class} image={character.image} race={character.race} setLevel={setLevel} level={level} handleUpdate={handleUpdate} errors={errors ? errors : null} />
        <CharacterGrid>
          <EditStats stats={stats} handleStats={handleStats} />
          <EditSkills skills={updateSkills} handleSkills={handleSkills} {...character}/>
          <EditHP {...character} updatedLevel={level} setHpParams={setHpParams} />
        </CharacterGrid>
    </CharacterWrapper>
  )

}
