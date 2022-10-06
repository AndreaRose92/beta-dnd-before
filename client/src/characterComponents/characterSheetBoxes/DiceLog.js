import React, { useContext } from 'react'
import { DiceContext } from '../../hookComponents'
import { DetailContext } from '../../hookComponents/PlayerEvents'
import { Button, DiceBox } from '../../styles'
import { DetailsPane } from '../../styles/CharacterSheetGrids.style'

export const DiceLog = () => {

     const {diceHistory, setDiceHistory} = useContext(DiceContext)

     const {details, setDetails} = useContext(DetailContext)

     const dismissRoll = input => {
     setDiceHistory(rolls => rolls.filter(roll => roll.id !== input))
     }

     const history = diceHistory.map(roll => {
          return (
               <div className='rollBox' key={roll.id} onClick={()=>dismissRoll(roll.id)}>
                    <h4 className='skillName'>{roll.name}</h4>
                    <h3 className='rollCalc' >{roll.amt}d{roll.dSize}: {`[${roll.rolls.join(', ')}]`} {roll.modifier}</h3>
                    <h1 className='total'>{roll.total}</h1>
               </div>
          )
     })

     while (details !== null) {
          return (
               <DetailsPane onClick={()=>setDetails(null)}>
                    <h2>{details.name}</h2>
                    <h4>{details.desc}</h4>
               </DetailsPane>
          )
     }
     
     return (
          <DiceBox>
               <h2>Dice Log</h2>
               <div className='rollContainer'>{history}</div>
               <Button className='clear' onClick={()=>setDiceHistory([])} >Clear Log</Button>
          </DiceBox>
     )
     
}