import React, { useContext } from 'react'
import { damageTypeIcon, DiceContext, diceRoll } from '../../../hookComponents'
import { SpellGrid, SpellHeader, SpellRow, SpellTable, SpellButton } from '../../../styles'

export const SpellBook = ({spells, spellcasting_modifier}) => {
  
    const {diceHistory, setDiceHistory} = useContext(DiceContext)

    const spellAttack = (name, modifier, dSize, dAmt) => {
        let newRoll = diceRoll(name, modifier, dSize, dAmt)
        if (!diceHistory[0]) {newRoll.id = 1}
        else {newRoll.id = diceHistory[diceHistory.length - 1].id + 1 }
        setDiceHistory(history => [...history, newRoll])
    }
    
    const renderSpells = spells.map(spell => {

        // console.log(spell.findLast(dmg => dmg !== null))

        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spell.dc_type ? `${spellcasting_modifier + 8} ${spell.dc_type.slice(0, 3)}` : null}</h4>
                <h4>{spell.duration}</h4>
                <h4>{spell.concentration ? '©️' :  null}</h4>
                <h4>{spell.ritual ? '®️' :  null}</h4>
            </SpellRow>
        )
    })

    return (
        <SpellTable>
            <SpellHeader>
                <h3>Name</h3>
                <h3>Time</h3>
                <h3>Range</h3>
                <h3>Hit/DC</h3>
                <h3>Effect</h3>
                <h3>Notes</h3>
            </SpellHeader>
            <SpellGrid>
                {renderSpells}
            </SpellGrid>
        </SpellTable>
    )


}
