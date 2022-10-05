import React from 'react'
import { HealthInput, StatBox } from '../../styles'

export const EditStats = ({stats, handleStats}) => {

    const modifier = num => {
        let mod = Math.floor((num - 10) / 2)
        if (mod > 0) {mod = `+${mod}`}
        return mod
    }

    const valueCap = num => {
        let value
        if (num >= 20) {
            value = 20
        } else if (num >= 0) {
            value = num
        } else {
            value = 0
        }
        return value 
    }

    while (stats === null) {
        return (<div><h3>Loading...</h3></div>)
    }

  return (
    <React.Fragment>
        <StatBox>
            <div>
                <div><p>Strength</p></div>
                <div className='mid'><HealthInput type='number' name='strength' value={valueCap(stats.strength)} onChange={handleStats}/></div>
                <div className='bottom'><h4>{modifier(stats.strength)}</h4></div>
            </div>
        </StatBox>
        <StatBox>
            <div>
                <div><p>Strength</p></div>
                <div className='mid'><HealthInput type='number' name='dexterity' value={valueCap(stats.dexterity)} onChange={handleStats}/></div>
                <div className='bottom'><h4>{modifier(stats.dexterity)}</h4></div>
            </div>
        </StatBox>
        <StatBox>
            <div>
                <div><p>Strength</p></div>
                <div className='mid'><HealthInput type='number' name='constitution' value={valueCap(stats.constitution)} onChange={handleStats}/></div>
                <div className='bottom'><h4>{modifier(stats.constitution)}</h4></div>
            </div>
        </StatBox>
        <StatBox>
            <div>
                <div><p>Strength</p></div>
                <div className='mid'><HealthInput type='number' name='intelligence' value={valueCap(stats.intelligence)} onChange={handleStats}/></div>
                <div className='bottom'><h4>{modifier(stats.intelligence)}</h4></div>
            </div>
        </StatBox>
        <StatBox>
            <div>
                <div><p>Strength</p></div>
                <div className='mid'><HealthInput type='number' name='wisdom' value={valueCap(stats.wisdom)} onChange={handleStats}/></div>
                <div className='bottom'><h4>{modifier(stats.wisdom)}</h4></div>
            </div>
        </StatBox>
        <StatBox>
            <div>
                <div><p>Strength</p></div>
                <div className='mid'><HealthInput type='number' name='charisma' value={valueCap(stats.charisma)} onChange={handleStats}/></div>
                <div className='bottom'><h4>{modifier(stats.charisma)}</h4></div>
            </div>
        </StatBox>
    </React.Fragment>
  )
}
