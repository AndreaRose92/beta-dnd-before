import React from 'react'
import { TableRow } from '../../styles/Details.style'
import {FullCaster} from '../../hookComponents/Hooks'

export const SorcererHeader = () => {
  return (
    <React.Fragment>
      <h2>Sorcerery Points</h2>
      <h2>Features</h2>
      <h2>Cantrips Known</h2>
      <h2>Spells Known</h2>
      <FullCaster variant="Sorcerer"/>
    </React.Fragment>
  )
}

export const SorcererRows = ({levels, spells}) => {
  
  const renderRows = levels && spells ? levels.map(level => {

    let spell = level ? spells[level.level - 1] : null

    return (
      <TableRow>
      </TableRow>
    )

  }) : null
  
  return (
       <React.Fragment>
            {renderRows}
       </React.Fragment>
  )
}