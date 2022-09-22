import React from 'react'
import { NavButton } from '../tools/Hooks'
import { Link, useParams } from 'react-router-dom'

const CharacterCard = ({character, deleteCharacter}) => {

    const params = useParams()

    return (
    <div>
        <Link to={`/users/${params.username}/characters/${character.id}`}>
            <h3>{character.name}</h3>
            <p>Level {character.level} {character.race.name} {character.dnd_class.name}</p>
        </Link>
        <NavButton path={`/users/${params.username}/characters/${character.id}/edit`} text={"Edit"}/>
        <button value={character.id} onClick={deleteCharacter}>Delete</button>
    </div>
  )
}

export default CharacterCard