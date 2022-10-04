import React from 'react'
import { ActionHeader, ActionTable, ActionGrid, ActionRow } from '../../../styles'

export const ActionTab = ({stats, equipment, prof_bonus}) => {
  
  const renderActions = equipment.map(item => {
    
    let hitBonus
    if (item.weapon_range === 'Melee') {
      hitBonus = prof_bonus + stats[0].modifier
    } else if (item.weapon_range === "Ranged") {
      hitBonus = prof_bonus + stats[1].modifier
    }
    
    const damage = item.modifier !== 0 ? `${item.dAmt}d${item.dSize} + ${item.modifier}` : `${item.dAmt}d${item.dSize}`

    return (
      <ActionRow key={item.name}>
        <h4>{item.name}</h4>
        <h4>{item.normal_range}ft {item.long_range ? `/ ${item.long_range}ft` : null }</h4>
        <h4>+{hitBonus}</h4>
        <h4>{damage}</h4>
        <h4>{item.properties}</h4>
      </ActionRow>
    )
  })
  
  return (
    <ActionTable>
      <ActionHeader>
        <h3>Attack</h3>
        <h3>Range</h3>
        <h3>Hit/DC</h3>
        <h3>Damage</h3>
        <h3>Notes</h3>
      </ActionHeader>
      <ActionGrid>
        {renderActions}
      </ActionGrid>
    </ActionTable>
  )
}
