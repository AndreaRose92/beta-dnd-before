import React from 'react'
import {HalfCaster} from '../../hookComponents/Hooks'
import { TableRow } from '../../styles/Details.style'

export const RangerHeader = () => {
  return (
    <React.Fragment>
      <h2>Features</h2>
      <h2>Spells Known</h2>
      <HalfCaster variant="Ranger" />
    </React.Fragment>
  )
}

export const RangerRows = ({levels, spells}) => {
  
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