import React, { useContext } from 'react'
import { CharacterContext, NavButton, UserContext } from '../tools/Hooks'
import { Link } from 'react-router-dom'

const CharacterCard = ({character, deleteCharacter}) => {

    const {user} = useContext(UserContext)
    const {setCharacter} = useContext(CharacterContext)

    return (
    <div>
        <Link to={`/users/${user.username}/characters/${character.id}`}>
            <h3>{character.name}</h3>
            <p>Level {character.level} {character.race.name} {character.dnd_class.name}</p>
        </Link>
        <NavButton onClick={()=>setCharacter(character)} path={`/users/${user.username}/characters/${character.id}/edit`} text={"Edit"}/>
        <button value={character.id} onClick={deleteCharacter}>Delete</button>
    </div>
  )
}

export default CharacterCard