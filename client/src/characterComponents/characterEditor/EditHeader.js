import React from 'react'
import { Button, CSHeader, Error } from '../../styles'

export const EditHeader = ({dnd_class, race, name, level, image, handleUpdate, errors, setLevel}) => {
  
  return (
    <CSHeader variant={dnd_class.name}>
        <div className='CSHeader1'>
            <img src={image} alt='character avatar'/>
        </div>
        <div className='CSHeader2'>
            <h1>{name}</h1>
            <h3>Level <input type='number' value={level} onChange={e=>setLevel(parseInt(e.target.value))}/></h3>
            <h3>{`${race.name} ${dnd_class.name}`}</h3>
        </div>
        <Button type='submit' onClick={handleUpdate}>Submit</Button>
        {errors ? errors.map(err => (<Error key={err}>{err}</Error>)) : null}
    </CSHeader>
  )
}