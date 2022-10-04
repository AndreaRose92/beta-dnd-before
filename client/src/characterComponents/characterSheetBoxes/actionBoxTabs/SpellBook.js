import React, { useContext } from 'react'
import { damageTypeIcon, DiceContext, diceRoll } from '../../../hookComponents'
import { SpellGrid, SpellHeader, SpellRow, SpellTable, SpellButton } from '../../../styles'

export const SpellBook = ({spells, spellcasting_modifier, level}) => {
  
    const {diceHistory, setDiceHistory} = useContext(DiceContext)

    const spellAttack = (name, modifier, dSize, dAmt) => {
        let newRoll = diceRoll(name, modifier, dSize, dAmt)
        if (!diceHistory[0]) {newRoll.id = 1}
        else {newRoll.id = diceHistory[diceHistory.length - 1].id + 1 }
        setDiceHistory(history => [...history, newRoll])
    }
    
    const renderSpells = spells.sort((a,b) => a.level - b.level).map(spell => {

        let cantripLevel
        switch (level) {
            case level >= 17:
                cantripLevel = 17
                break;
            case level >= 11:
                cantripLevel = 11
                break;
            case level >= 5:
                cantripLevel = 5
                break;
            default:
                cantripLevel = 1
        }

        let slotLevel = spell.damage ? spell.damage.find(slot => slot.level === spell.level) : null
        if (spell.damage && spell.level === 0) {slotLevel = spell.damage.find(slot => slot.level === cantripLevel)}
        const damage = slotLevel ? `${slotLevel.dAmt}d${slotLevel.dSize}` : null
        const damageButton = spell.damage ? <SpellButton onClick={()=>spellAttack(spell.name, spellcasting_modifier, slotLevel.dSize, slotLevel.dAmt)}>{damage}{damageTypeIcon(spell.damage_type)}</SpellButton> : <h4>---</h4>

        return (
            <SpellRow key={spell.name}>
                <h4>{spell.name}</h4>
                <h4>{spell.casting_time}</h4>
                <h4>{spell.range}</h4>
                <h4>{spell.dc_type ? `${spellcasting_modifier + 8} ${spell.dc_type.slice(0, 3)}` : null}</h4>
                {damageButton}
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
