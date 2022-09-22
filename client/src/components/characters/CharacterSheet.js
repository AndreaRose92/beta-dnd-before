import React, { useContext, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { getRequest } from '../tools/FetchTypes'
import { CharacterContext } from '../tools/Hooks'

const CharacterSheet = () => {
  
    const params = useParams()
    const {character, setCharacter} = useContext(CharacterContext)
    const stats = character.name !== '' ? character.stats : [['', 0]]
    useEffect(()=>{getRequest(`/characters/${params.id}`, setCharacter)}, [params.id, setCharacter])

    const renderStats = stats.map(stat => {
        return <li key={stat[0]}>{stat[0]}: {stat[1]}</li>
    })

    while (character.name === '') {
        return (
            <div>
                <h3>Loading...</h3>
            </div>
        )
    }

    return (
    <div>
        <h1>{character.name}</h1>
        <h2>Level {character.level} {character.race.name} {character.dnd_class.name}</h2>
        <h3>Current HP: {character.current_hp}</h3>
        <h3>Max HP: {character.hp}</h3>
        <ul>
            {renderStats}
        </ul>
    </div>
  )
}

export default CharacterSheet