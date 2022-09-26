import React from 'react'
import {HalfCaster} from '../../hookComponents/Hooks'
import { TableRow } from '../../styles/Details.style'

export const PaladinHeader = () => {
  return (
    <React.Fragment>
      <h2>Features</h2>
      <HalfCaster variant="Paladin" />
    </React.Fragment>
  )
}

export const PaladinRows = ({levels, spells}) => {
  
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