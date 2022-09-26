import React from 'react'
import { TableRow } from '../../styles/Details.style'

export const BarbarianHeader = () => {

     return (
          <React.Fragment>
               <h2>Features</h2>
               <h2>Rages</h2>
               <h2>Rage Damage</h2>
          </React.Fragment>
     )
}

export const BarbarianRows = ({levels}) => {
     
     const renderRows = levels.map(level => {
          return(
               <TableRow key={level.level} level={level.level} variant="Barbarian">
                    <h2>{level.level}</h2>
                    <h2>{level.prof_bonus}</h2>
                    <h2>{level.features !== '' ? level.features : '-'}</h2>
                    <h2>{level.rage_count}</h2>
                    <h2>{level.rage_damage_bonus}</h2>
               </TableRow>
          )
     })
     
     return (
          <React.Fragment>{renderRows}</React.Fragment>
     )
}