import React, { useContext } from 'react'
import { NavButton, UserContext } from './tools/Hooks'
import { deleteRequest } from './tools/FetchTypes'
import { Link } from 'react-router-dom'

const CharacterCard = ({character}) => {

    const {user} = useContext(UserContext)

    return (
    <div>
        <Link to={`/users/${user.username}/characters/${character.id}`}>
            <h3>{character.name}</h3>
            <p>Level {character.level} {character.race} {character.dnd_class}</p>
        </Link>
        <NavButton path={`/users/${user.username}/characters/${character.id}/edit`} text={"Edit"}/>
        <button onClick={()=>deleteRequest(`/characters/${character.id}`)}>Delete</button>
    </div>
  )
}

export default CharacterCard