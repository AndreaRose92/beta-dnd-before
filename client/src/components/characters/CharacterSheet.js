import React, { useContext, useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import { getRequest } from '../tools/FetchTypes'
import { CharacterContext } from '../tools/Hooks'
import { skills, savingThrows } from '../data/skills'
import { CharacterGrid, CharacterWrapper } from '../styles/Grids.styles'
import { AuxiliaryBox, CSHeader, HealthBox, InspirationBox, StatBox } from '../styles/CharacterSheetGrids.style'
import { HealthButton } from '../styles/Buttons.style'
import { HealthInput } from '../styles/Input.style'

const CharacterSheet = () => {
  
    const params = useParams()
    const {character, setCharacter} = useContext(CharacterContext)
    const stats = character.name !== '' ? character.stats : [{name: '', value: 0}]
    useEffect(()=>{getRequest(`/characters/${params.id}`, setCharacter)}, [params.id, setCharacter])

    while (character.name === '') {
        return (
            <div>
                <h3>Loading...</h3>
            </div>
        )
    }

    const isProficient = string => {
        return character.skills.includes(string)
    }

    const prof_bonus = character.name !== '' ? character.dnd_class.levels[character.level-1].prof_bonus : null

    const findStat = str => {
        const stat = stats.find(stat => stat.name === str)
        return stat
    }

    function skillProficiency(prof, skill) {
        let stat = findStat(skill)
        let total
        isProficient(prof) ? total = `+${parseInt(stat.modifier) + prof_bonus}` : total = stat.modifier
        return total
    }

    const renderStats = stats.map(stat => {
        return (
            <StatBox key={stat.name}>
                <div>
                    <div><p>{stat.name}</p></div>
                    <div className='mid'>
                        <h2>{stat.modifier}</h2>
                    </div>
                    <div className='bottom'>
                        <h4>{stat.value}</h4>
                    </div>
                </div>
            </StatBox>
        )
    })

    const renderSkills = skills.map(skill => {
        return (
            <li key={skill.name}>
                {isProficient(skill.name) ? "●" : "○"}/{skill.stat.slice(0,3)}/{skill.name}/{skillProficiency(skill.name, skill.stat)}
            </li>
        )
    })

    const renderSavingThrows = savingThrows.map(save => {
        return (
            <li key={save.name}>
                {isProficient(save.name) ? "●" : "○"}{" "}
                {`${save.stat.slice(0,3)} ${skillProficiency(save.name, save.stat)}`}
            </li>
        )
    })


    return (
    <CharacterWrapper>
        <CharacterGrid>
            <CSHeader>
                <div className='CSHeader1'>
                    <img src={character.image} alt='character avatar'/>
                </div>
                <div className='CSHeader2'>
                    <h1>{character.name}</h1>
                    <div>
                        <h2>{`Level ${character.level} ${character.race.name} ${character.dnd_class.name}`}</h2>
                    </div>
                </div>
            </CSHeader>
            <>{renderStats}</>
            <AuxBox character={character} prof_bonus={prof_bonus}/>
            <HPBox character={character} setCharacter={setCharacter}/>
        </CharacterGrid>
    </CharacterWrapper>
  )
}

const AuxBox = ({character, prof_bonus}) => {

    const [isInspired, setIsInspired] = useState(false)

    const handleInspiration = () => {
        setIsInspired(pv => !pv)
    }

    return (
        <>
            <AuxiliaryBox>
                <div>
                    <div><p>WALKING</p></div>
                    <div className='mid'>
                        <h2>{character.race.speed}</h2>
                        <h4>{`ft.`}</h4>
                    </div>
                    <div className='bottom'>
                        <h4>SPEED</h4>
                    </div>
                </div>
            </AuxiliaryBox>
            <AuxiliaryBox>
                <div>
                    <div><p>PROFICIENCY</p></div>
                    <div className='mid'><h2>+{prof_bonus}</h2></div>
                    <div className='bottom'><h4>BONUS</h4></div>
                </div>
            </AuxiliaryBox>
            <InspirationBox>
                <div>
                    <div onClick={handleInspiration} className='inspiration-box'>
                        <h1>{isInspired ? '☀︎' : ''}</h1>
                    </div>
                    <div className='bottom'><h4>INSPIRATION</h4></div>
                </div>
            </InspirationBox>
        </>
    )
}   

const HPBox = ({character, setCharacter}) => {
    const [newHP, setNewHP] = useState(0)
    const handleHP = e => {
        e.preventDefault()
        let updatedHP
        if (e.target.name === 'heal') {
            updatedHP = parseInt(character.current_hp) + parseInt(newHP)
        } else if (e.target.name === 'damage') {
            updatedHP = parseInt(character.current_hp) - parseInt(newHP)
        }
        fetch(`/characters/${character.id}`,{
            method: "PATCH",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify({
                current_hp: updatedHP
            })
        }).then(r=>{
            if (r.ok) {
                r.json().then(update=>setCharacter(update))
            } else {
                r.json().then(errors=>console.log(errors))
            }
        })
    }

    return (
        <HealthBox>
            <div className='heal-buttons'>
                <HealthButton name="heal" onClick={handleHP}>Heal</HealthButton>
                <HealthInput value={newHP} onChange={e=>setNewHP(e.target.value)} className='mid' type='number'/>
                <HealthButton variant='rust' name="damage" onClick={handleHP}>Damage</HealthButton>
            </div>
            <div>
                <div><p>CURRENT</p></div>
                <div className="mid"><h2>{character.current_hp}</h2></div>                        
            </div>
            <div>
                <div><p>MAXIMUM</p></div>
                <div className="mid"><h2>{character.hp}</h2></div>
                <div className="bottom">
                    <h4>{'HEALTH & STATUS'}</h4>
                </div>
            </div>
            <div>
                <div><p>TEMPORARY</p></div>
                <div className="mid"><h2>{'--'}</h2></div>
            </div>
        </HealthBox>
    ) 
}

/* <h1>{character.name}</h1>
<h2>Level {character.level} {character.race.name} {character.dnd_class.name}</h2>
<h3>Current HP: {character.current_hp}</h3>
<h3>Max HP: {character.hp}</h3>
<h4>Proficiency Bonus: {prof_bonus}</h4>
<ul>{renderStats}</ul>
<ul>{renderSkills}</ul>
<ul>{renderSavingThrows}</ul> */
export default CharacterSheet