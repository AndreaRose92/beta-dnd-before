import React, { useState } from 'react';
import { Button, HealthBox } from '../../styles';

export const EditHP = ({ max_hp, updatedLevel, level, dnd_class, setHpParams }) => {
	const [display, setDisplay] = useState('fixed');
	const [hitDice, setHitDice] = useState([]);

	let renderOption = null;

	if (updatedLevel > level) {
		renderOption = (
			<select name='hp_option' value={display} onChange={(e)=>setDisplay(e.target.value)}>
				<option value='fixed'>Fixed</option>
				<option value='rolled'>Rolled</option>
			</select>
		);
	}

	const rollHP = () => {
        let values = []
		let i = parseInt(level);
		while (i < updatedLevel) {
            values.push(Math.floor(Math.random() * (dnd_class.hit_die - 1) + 1))
			i++;
		}
        setHitDice(values)
        setHpParams({
            max_hp: max_hp,
            hp_option: display,
            hp_values: values
        })
	};

    const renderRolls = hitDice.map(roll => {
        return <p>{`[${roll}]`}</p>
    })

	return (
		<HealthBox>
			<div style={{ marginLeft: '5px' }}>
				<div>
					<p>MAXIMUM</p>
				</div>
				<div className='mid'>
					<h2>{max_hp}</h2>
				</div>
			</div>
			<div>
				<div>
					<p>OPTION</p>
				</div>
				<div className='mid'>{renderOption}</div>
				<div className='bottom'>
					{display === 'rolled' ? (
						<Button onClick={() => rollHP()}>Roll Dice</Button>
					) : null}
				</div>
			</div>
            <div>{renderRolls}</div>
		</HealthBox>
	);
};
