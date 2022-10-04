import { createContext, useState, Fragment } from 'react';
import { useNavigate } from 'react-router-dom';


export const UserContext = createContext();

export const UserProvider = ({ children }) => {
	const [user, setUser] = useState(null);
	return (
		<UserContext.Provider value={{ user, setUser }}>
			{children}
		</UserContext.Provider>
	);
};

export const CharacterContext = createContext();

export const CharacterProvider = ({ children }) => {
	const [character, setCharacter] = useState({
		name: '',
		level: 0,
		user_id: 0,
		dnd_class_id: 0,
		race_id: 0,
		stats: {
          strength: 0,
          dexterity: 0,
          constitution: 0,
          intelligence: 0,
          wisdom: 0,
          charisma: 0,
		},
		hp: 0,
		current_hp: 0,
	});
	return (
		<CharacterContext.Provider value={{ character, setCharacter }}>
			{children}
		</CharacterContext.Provider>
	);
};

export const NavButton = ({ path = '/', text = 'back' }) => {
	const navigate = useNavigate();
	return <button onClick={() => navigate(path)}>{text}</button>;
};

export const capitalize = (string) => {
	return string.charAt(0).toUpperCase() + string.slice(1);
};

export const FullCaster = ({ variant }) => {
	return (
		<Fragment>
			<h3>Spell Slots per Spell Level</h3>
			<div className='spellTable' variant={variant}>
				<h4>1st</h4>
				<h4>2nd</h4>
				<h4>3rd</h4>
				<h4>4th</h4>
				<h4>5th</h4>
				<h4>6th</h4>
				<h4>7th</h4>
				<h4>8th</h4>
				<h4>9th</h4>
			</div>
		</Fragment>
	);
};

export const HalfCaster = ({ variant }) => {
	return (
		<Fragment>
			<h3>Spell Slots per Spell Level</h3>
			<div className='halfSpellTable' variant={variant}>
				<h4>1st</h4>
				<h4>2nd</h4>
				<h4>3rd</h4>
				<h4>4th</h4>
				<h4>5th</h4>
			</div>
		</Fragment>
	);
};

export const damageTypeIcon = (damageType) => {
	switch (damageType) {
		case 'Acid': return '☢️';
		case 'Bludgeoning': return '🔨';
		case 'Cold': return '❄️';
		case 'Fire': return '🔥';
		case 'Force': return '‼️';
		case 'Lightning': return '⚡';
		case 'Necrotic': return '💀';
		case 'Piercing': return '🗡️';
		case 'Poison': return '☣️';
		case 'Psychic': return '🧠';
		case 'Radiant': return '🔆';
		case 'Slashing': return '⚔️';
		case 'Thunder': return '⛈️';
		default: return '-'
	}
}