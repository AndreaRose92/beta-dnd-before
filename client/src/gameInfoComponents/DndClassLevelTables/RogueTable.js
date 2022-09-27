import React from 'react';
import { TableRow } from '../../styles';

export const RogueHeader = () => {
	return (
		<React.Fragment>
			<h2>Sneak Attack</h2>
			<h2>Features</h2>
		</React.Fragment>
	);
};

export const RogueRows = ({ levels }) => {
	const renderRows = levels
		? levels.map((level) => {
				return (
					<TableRow key={level.level} level={level.level} variant='Rogue'>
						<h2>{level.level}</h2>
						<h2>{level.prof_bonus}</h2>
						<h2>{level.sneak_attack_dice_count}d{level.sneak_attack_dice_value}</h2>
						<h2>{level.features !== '' ? level.features : '-'}</h2>
					</TableRow>
				);
		  })
		: null;

	return <React.Fragment>{renderRows}</React.Fragment>;
};
