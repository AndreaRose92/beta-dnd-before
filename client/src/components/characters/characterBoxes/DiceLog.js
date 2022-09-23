import React from 'react'
import Button from '../../styles/Buttons.style'
import { DiceBox } from '../../styles/Grids.styles'

const DiceLog = ({diceRolls, setDiceRolls}) => {
  
     const dismissRoll = input => {
          setDiceRolls(rolls => rolls.filter(roll => roll.id !== input))
     }

     const history = 
     diceRolls.length <= 5
          ? diceRolls.map(roll => {
               return (
                    <div className='rollBox' key={roll.id} onClick={()=>dismissRoll(roll.id)}>
                         <h3 className='skillName'>{roll.name} Check</h3>
                         <h3 className='rollCalc' >{roll.amt}d{roll.dSize}: {`[${roll.rolls.join(', ')}]`} {roll.modifier}</h3>
                         <h1 className='total'>{roll.total}</h1>
                    </div>
               )
          })
          : diceRolls.slice(diceRolls.length - 5).map(roll => {
               return (
                    <div className='rollBox' key={roll.id} onClick={()=>dismissRoll(roll.id)}>
                         <h3 className='skillName'>{roll.name} Check</h3>
                         <h3 className='rollCalc' >{roll.amt}d{roll.dSize}: {`[${roll.rolls.join(', ')}]`} {roll.modifier}</h3>
                         <h1 className='total'>{roll.total}</h1>
                    </div>
               )
          })
  
     console.log(diceRolls)
     return (
          <DiceBox>
               <h2>Dice Log</h2>
               {history}<br/>
               <Button className='clear' onClick={()=>setDiceRolls([])} >Clear Log</Button>
          </DiceBox>
     )
}

export default DiceLog