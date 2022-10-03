import React from 'react'
import { Error } from '../../../styles'

export const CharacterFormButtons = ({handlePage, errors}) => {
  return (
    <div className='navButtons'>
        <button type='submit' value='basics' onClick={e=>handlePage(e)}>Basics</button>
        <button type='submit' value='stats' onClick={e=>handlePage(e)}>Stats</button>
        <button type='submit' value='skills' onClick={e=>handlePage(e)}>Skills</button>
        <button type='submit' value='spells' onClick={e=>handlePage(e)}>Spells</button>
        <button type='submit' value='review' onClick={e=>handlePage(e)}>Review</button>
        {errors ? errors.map(err => <Error key={err}>{err}</Error>) : null}
    </div>
  )
}
