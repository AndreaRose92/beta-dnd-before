import React from 'react'
import { useNavigate } from 'react-router-dom'
import { Button, CSHeader } from '../../styles'

export const CharHeader = ({dnd_class, race, name, level, image}) => {
  
  const navigate=useNavigate()
  
  return (
    <CSHeader variant={dnd_class.name}>
        <div className='CSHeader1'>
            <img src={image} alt='character avatar'/>
        </div>
        <div className='CSHeader2'>
            <h1>{name}</h1>
            <h3>{`Level ${level}`}<br/>{`${race.name} ${dnd_class.name}`}</h3>
        </div>
        <Button onClick={()=>navigate(`./edit`)}>Edit</Button>
    </CSHeader>
  )
}