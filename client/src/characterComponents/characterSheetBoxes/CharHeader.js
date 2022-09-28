import React from 'react'
import { useNavigate } from 'react-router-dom'
import { Button, CSHeader, Error } from '../../styles'

export const CharHeader = ({character}) => {
  
  const navigate=useNavigate()
  
  return (
    <CSHeader variant={character.dnd_class.name}>
        <div className='CSHeader1'>
            <img src={character.image} alt='character avatar' />
        </div>
        <div className='CSHeader2'>
            <h1>{character.name}</h1>
            <h2>{`Level ${character.level}`}<br/>{`${character.race.name} ${character.dnd_class.name}`}</h2>
        </div>
        <Button onClick={()=>navigate(`./edit`)}>Edit</Button>
    </CSHeader>
  )
}