import React from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Button, CharCard } from '../styles'
import { CharButtons, CharName } from '../styles/Grids.styles'

export const CharacterCard = ({character, deleteCharacter}) => {

    const navigate = useNavigate()

    return (
    <CharCard variant={character.dnd_class.name} >
        <Link className='avatar' to={`./characters/${character.id}`}>
            <img src={character.image} alt={character.name}/>
        </Link>
        <CharName as={Link} to={`./characters/${character.id}`}>
            <h3>{character.name}</h3>
            <h4>Level {character.level} {character.race.name} {character.dnd_class.name}</h4>
        </CharName>
        <CharButtons>
            <Button type='button' className='edit' onClick={()=>navigate(`./characters/${character.id}/edit`)}>Edit</Button>
            <Button type='button' className='delete' onClick={()=>deleteCharacter(character)}>Delete</Button>
        </CharButtons>
    </CharCard>
  )
}