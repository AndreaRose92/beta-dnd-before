import React from 'react'
import { Button, Error } from '../../styles'

export const CharacterFormButtons = ({handlePage, errors}) => {
  return (
    <div className='navButtons'>
        <Button type='submit' value='basics' onClick={e=>handlePage(e)}>Basics</Button>
        <Button type='submit' value='stats' onClick={e=>handlePage(e)}>Stats</Button>
        <Button type='submit' value='skills' onClick={e=>handlePage(e)}>Skills</Button>
        <Button type='submit' value='spells' onClick={e=>handlePage(e)}>Spells</Button>
        <Button type='submit' value='levels' onClick={e=>handlePage(e)}>Levels</Button>
        <Button type='submit' value='review' onClick={e=>handlePage(e)}>Review</Button>
        {errors ? errors.map(err => <Error key={err}>{err}</Error>) : null}
    </div>
  )
}
