import React from 'react'
import { FullCaster } from '../../hookComponents/Hooks'
import { TableRow } from '../../styles/Details.style'

export const ClericHeader = () => {
  return (
    <React.Fragment>
     <h2>Features</h2>
     <h2>Cantrips Known</h2>
     <FullCaster variant="Cleric"/>
    </React.Fragment>
  )
}

export const ClericRows = ({levels, spells}) => {
  
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