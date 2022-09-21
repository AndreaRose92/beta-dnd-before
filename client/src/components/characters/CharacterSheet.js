import React, { useContext, useEffect } from 'react'
import { useParams } from 'react-router-dom'
import { getRequest } from '../tools/FetchTypes'
import { CharacterContext, UserContext } from '../tools/Hooks'

const CharacterSheet = () => {
  
    const params = useParams()
    const {user} = useContext(UserContext)
    const {character, setCharacter} = useContext(CharacterContext)
  
    useEffect(()=>{getRequest(`/characters/${params.id}`, setCharacter)}, [])

    console.log(character)

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