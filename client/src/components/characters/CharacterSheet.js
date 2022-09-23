import React, { useContext, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { getRequest } from '../tools/FetchTypes'
import { CharacterContext } from '../tools/Hooks'
import { skills, savingThrows } from '../data/skills'
import { CharacterGrid } from '../styles/Grids.styles'

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
        return <li key={stat.name}>{stat.name}: {stat.value} Bonus: {stat.modifier}</li>
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
    <CharacterGrid>
        <h1>{character.name}</h1>
        <h2>Level {character.level} {character.race.name} {character.dnd_class.name}</h2>
        <h3>Current HP: {character.current_hp}</h3>
        <h3>Max HP: {character.hp}</h3>
        <h4>Proficiency Bonus: {prof_bonus}</h4>
        <ul>{renderStats}</ul>
        <ul>{renderSkills}</ul>
        <ul>{renderSavingThrows}</ul>
    </CharacterGrid>
  )
}

export default CharacterSheet