import React, { createContext, useState } from 'react';
import { FullCaster, HalfCaster } from './Hooks';

export const DiceContext = createContext();

export const DiceProvider = ({ children }) => {
	const [diceHistory, setDiceHistory] = useState([]);
	return (
		<DiceContext.Provider value={{ diceHistory, setDiceHistory }}>
			{children}
		</DiceContext.Provider>
	);
};

export const diceRoll = (name = '', modifier = '', dSize = 20, amt = 1) => {
	let total = 0;
	let rolls = [];
	for (let i = 0; i < amt; i++) {
		rolls.push(Math.floor(Math.random() * (dSize - 1) + 1));
	}
	total = rolls.reduce((a, b) => a + b, total) + parseInt(modifier);
	const result = {
		name: name,
		modifier: modifier,
		total: total,
		dSize: dSize,
		amt: amt,
		rolls: rolls,
	};
	return result;
};

export const DetailContext = createContext();

export const DetailProvider = ({ children }) => {
	const [details, setDetails] = useState(null);
	return (
		<DetailContext.Provider value={{ details, setDetails }}>
			{children}
		</DetailContext.Provider>
	);
};

export const ClassHeaderVariants = (name) => {
	switch (name) {
		case 'Barbarian':
			return (
				<>
					<h2>Rage Count</h2>
					<h2>Damage Bonus</h2>
				</>
			);
		case 'Bard':
			return (
				<>
					<h2>Bardic Inspiration</h2>
					<h2>Song of Rest</h2>
					<h2>Cantrips Known</h2>
					<h2>Spells Known</h2>
					<FullCaster variant={'Bard'} />
				</>
			);
		case 'Cleric':
			return (
				<>
					<h2>Cantrips Known</h2>
					<FullCaster variant={'Cleric'} />
				</>
			);
		case 'Druid':
			return (
				<>
					<h2>Cantrips Known</h2>
					<FullCaster variant={'Druid'} />
				</>
			);
		case 'Fighter':
			return (
				<>
					<h2>Action Surges</h2>
					<h2>Extra Attacks</h2>
					<h2>Indomitable Uses</h2>
				</>
			);
		case 'Monk':
			return (
				<>
					<h2>Martial Arts</h2>;<h2>Ki Points</h2>
					<h2>Unarmored Movement</h2>
				</>
			);
		case 'Paladin':
			return <HalfCaster variant={'Paladin'} />;
		case 'Ranger':
			return (
				<>
					<h2>Spells Known</h2>
					<HalfCaster variant={'Ranger'} />
				</>
			);
		case 'Rogue':
			return (
				<>
					<h2>Sneak Attack</h2>
				</>
			);
		case 'Sorcerer':
			return (
				<>
					<h2>Sorcerery Points</h2>
					<h2>Metamagic Known</h2>
					<h2>Cantrips Known</h2>
					<h2>Spells Known</h2>
					<FullCaster variant={'Sorcerer'} />
				</>
			);
		case 'Warlock':
			return (
				<>
					<h2>Cantrips Known</h2>
					<h2>Spells Known</h2>
					<h2>Spell Slots</h2>
					<h2>Slot Level</h2>
					<h2>Invocations Known</h2>
				</>
			);
		case 'Wizard':
			return (
				<>
					<h2>Cantrips Known</h2>
					<FullCaster variant={'Wizard'} />
				</>
			);
		default:
			return null;
	}
};

export const ClassDetailVariants = (level, name) => {
	switch (name) {
		case 'Barbarian':
			return barbarianRow(level);
		case 'Bard':
			return bardRow(level);
		case 'Cleric':
			return clericRow(level);
		case 'Druid':
			return druidRow(level);
		case 'Fighter':
			return fighterRow(level);
		case 'Monk':
			return monkRow(level);
		case 'Paladin':
			return paladinRow(level);
		case 'Ranger':
			return rangerRow(level);
		case 'Rogue':
			return rogueRow(level);
		case 'Sorcerer':
			return sorcererRow(level);
		case 'Warlock':
			return warlockRow(level);
		case 'Wizard':
			return wizardRow(level);
		default:
			return null;
	}
};

const casterRow = (level) => {
	return (
		<>
			<h4>{level.lvl_1_spell_slots}</h4>
			<h4>{level.lvl_2_spell_slots !== 0 ? level.lvl_2_spell_slots : '-'}</h4>
			<h4>{level.lvl_3_spell_slots !== 0 ? level.lvl_3_spell_slots : '-'}</h4>
			<h4>{level.lvl_4_spell_slots !== 0 ? level.lvl_4_spell_slots : '-'}</h4>
			<h4>{level.lvl_5_spell_slots !== 0 ? level.lvl_5_spell_slots : '-'}</h4>
			<h4>{level.lvl_6_spell_slots !== 0 ? level.lvl_6_spell_slots : '-'}</h4>
			<h4>{level.lvl_7_spell_slots !== 0 ? level.lvl_7_spell_slots : '-'}</h4>
			<h4>{level.lvl_8_spell_slots !== 0 ? level.lvl_8_spell_slots : '-'}</h4>
			<h4>{level.lvl_9_spell_slots !== 0 ? level.lvl_9_spell_slots : '-'}</h4>
		</>
	);
};

const barbarianRow = (level) => {
	return (
		<>
			<h2>{level.rage_count}</h2>
			<h2>{level.rage_damage_bonus}</h2>
		</>
	);
};

const bardRow = (level) => {
	return <>
    <h2>{level.bardic_inspiration_die}</h2>
    <h2>{level.song_of_rest_die}</h2>
    <h2>{level.cantrips_known}</h2>
    <h2>{level.spells_known}</h2>
    {casterRow(level)}
    </>;
};

const clericRow = (level) => {
	return <>
    
    </>;
};

const druidRow = (level) => {
	return <>
    
    </>;
};

const fighterRow = (level) => {
	return <>
    
    </>;
};

const monkRow = (level) => {
	return <>
    
    </>;
};

const paladinRow = (level) => {
	return <>
    
    </>;
};

const rangerRow = (level) => {
	return <>
    
    </>;
};

const rogueRow = (level) => {
	return <>
    
    </>;
};

const sorcererRow = (level) => {
	return <>
    
    </>;
};

const warlockRow = (level) => {
	return <>
    
    </>;
};

const wizardRow = (level) => {
	return (
		<>
			<h2>{level.cantrips_known}</h2>
			{casterRow(level)}
		</>
	);
};
