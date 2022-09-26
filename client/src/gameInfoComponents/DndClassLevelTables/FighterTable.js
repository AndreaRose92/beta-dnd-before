import React from 'react'
import { TableRow } from '../../styles/Details.style'

export const FighterHeader = () => {
  return (
    <React.Fragment>
      <h2>Features</h2>
    </React.Fragment>
  )
}

export const FighterRows = ({levels, spells}) => {
  
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