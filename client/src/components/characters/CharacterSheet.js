import React, { useContext, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { getRequest } from '../tools/FetchTypes'
import { CharacterContext } from '../tools/Hooks'

const CharacterSheet = () => {
  
    const params = useParams()
    const {character, setCharacter} = useContext(CharacterContext)

    useEffect(()=>{getRequest(`/characters/${params.id}`, setCharacter)}, [params.id, setCharacter])

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
    </div>
  )
}

export default CharacterSheet