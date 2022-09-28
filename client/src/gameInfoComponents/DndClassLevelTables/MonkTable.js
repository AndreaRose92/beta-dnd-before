import React from 'react';
import { TableRow } from '../../styles';

export const MonkHeader = () => {
	return (
		<React.Fragment>
			<h2>Martial Arts</h2>
			<h2>Ki Points</h2>
			<h2>Unarmored Movement</h2>
			<h2>Features</h2>
		</React.Fragment>
	);
};

export const MonkRows = ({ levels }) => {
	const renderRows = levels
		? levels.map((level) => {
				return (
					<TableRow key={level.level} level={level.level} variant='Monk'>
						<h2>{level.level}</h2>
						<h2>{level.prof_bonus}</h2>
						<h2>{`${level.martial_arts_dice_count}d${level.martial_arts_dice_value}`}</h2>
						<h2>{level.ki_points}</h2>
						<h2>{level.unarmored_movement}ft</h2>
						<h2>{level.features !== '' ? level.features : '-'}</h2>
					</TableRow>
				);
		  })
		: null;

	return <React.Fragment>{renderRows}</React.Fragment>;
};
