import React, { useContext } from 'react'
import { DiceContext } from '../../hookComponents/PlayerEvents'
import Button from '../../styles/Buttons.style'
import { DiceBox } from '../../styles/Grids.styles'

const DiceLog = () => {
     
     const {diceHistory, setDiceHistory} = useContext(DiceContext)

     const dismissRoll = input => {
          setDiceHistory(rolls => rolls.filter(roll => roll.id !== input))
     }

     const history = 
     diceHistory.length <= 5
          ? diceHistory.map(roll => {
               return (
                    <div className='rollBox' key={roll.id} onClick={()=>dismissRoll(roll.id)}>
                         <h3 className='skillName'>{roll.name}</h3>
                         <h3 className='rollCalc' >{roll.amt}d{roll.dSize}: {`[${roll.rolls.join(', ')}]`} {roll.modifier}</h3>
                         <h1 className='total'>{roll.total}</h1>
                    </div>
               )
          })
          : diceHistory.slice(diceHistory.length - 5).map(roll => {
               return (
                    <div className='rollBox' key={roll.id} onClick={()=>dismissRoll(roll.id)}>
                         <h3 className='skillName'>{roll.name}</h3>
                         <h3 className='rollCalc' >{roll.amt}d{roll.dSize}: {`[${roll.rolls.join(', ')}]`} {roll.modifier}</h3>
                         <h1 className='total'>{roll.total}</h1>
                    </div>
               )
          })
          
     return (
          <DiceBox>
               <h2>Dice Log</h2>
               {history}<br/>
               <Button className='clear' onClick={()=>setDiceHistory([])} >Clear Log</Button>
          </DiceBox>
     )
}

export default DiceLog