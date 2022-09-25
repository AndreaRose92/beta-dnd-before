import React from 'react'
import { CSHeader } from '../../styles/CharacterSheetGrids.style'

const CharHeader = ({character}) => {
  return (
    <CSHeader>
        <div className='CSHeader1'>
            <img src={character.image} alt='character avatar' />
        </div>
        <div className='CSHeader2'>
            <h1>{character.name}</h1>
            <div><h2>{`Level ${character.level} ${character.race.name} ${character.dnd_class.name}`}</h2></div>
        </div>
    </CSHeader>
  )
}

export default CharHeader