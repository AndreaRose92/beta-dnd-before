import React, { useContext } from 'react'
import { CharacterContext, NavButton, UserContext } from '../tools/Hooks'
import { deleteRequest } from '../tools/FetchTypes'
import { Link, useNavigate } from 'react-router-dom'

const CharacterCard = ({character, deleteCharacter}) => {

    const {user} = useContext(UserContext)
    const {setCharacter} = useContext(CharacterContext)
    const navigate = useNavigate()

    const handleDelete = () => {
        deleteCharacter(character)
        deleteRequest(`/characters/${character.id}`)
        navigate(`/users/${user.username}`)
    }
    

    return (
    <div>
        <Link to={`/users/${user.username}/characters/${character.id}`}>
            <h3>{character.name}</h3>
            <p>Level {character.level} {character.race} {character.dnd_class}</p>
        </Link>
        <NavButton onClick={()=>setCharacter(character)} path={`/users/${user.username}/characters/${character.id}/edit`} text={"Edit"}/>
        <button onClick={handleDelete}>Delete</button>
    </div>
  )
}

export default CharacterCard