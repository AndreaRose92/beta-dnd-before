import styled from 'styled-components';

export const DetailGrid = styled.div`
	display: grid;
	grid-template-columns: 3.5fr 2fr 100px;
	column-gap: 15px;
	grid-template-rows: 50px 1fr 50px;
`;

export const DetailsPane = styled.div`
	display: grid;
	grid-column: 2;
`

export const TitleRow = styled.h1`
	grid-column: 1;
	grid-row: 1;
`

export const TitleCard = styled.div`
	grid-column: 2;
	h3 {
		margin-left: 30px;
	}
`;

export const LevelsTable = styled.div`
	display: grid;
	grid-column: 1;
	grid-row: 2;
	background-color: gray;
	grid-template-columns: 1fr;
	grid-template-rows: (60px, 100px) 2fr;
	padding-bottom: 5px;
`;
export const TableHeader = styled.div`
	display: grid;
	grid-row: 1;
	text-align: center;
	border-bottom: black 2px solid;
	grid-template-columns: ${(props) => {
		switch (props.variant) {
			case 'Barbarian':
				return '1fr 1fr 2fr 1fr 1fr';
			case 'Bard':
				return '1fr 1fr 2fr 1fr 1fr 1fr 1fr 9fr';
			case 'Cleric':
				return '1fr 1fr 2.5fr 1fr 4.5fr';
			case 'Druid':
				return '1fr 1fr 2fr 1fr 9fr';
			case 'Fighter':
				return '1fr 1fr 3fr 1fr 1fr 1fr';
			case 'Monk':
				return '1fr 1fr 4fr 1fr 1fr 1fr';
			case 'Paladin':
				return '1fr 1fr 3fr 2fr';
			case 'Ranger':
				return '1fr 1fr 3fr 1fr 2fr';
			case 'Rogue':
				return '1fr 1fr 3fr 1fr';
			case 'Sorcerer':
				return '1fr 1fr 3fr 1fr 1fr 1fr 1fr 9fr';
			case 'Warlock':
				return '1fr 1fr 3fr 1fr 1fr 1fr 1fr 1fr';
			case 'Wizard':
				return '1fr 1fr 3fr 1fr 6fr';
			default:
				return 'none';
		}
	}};

	h2 {
		margin-top: 5px;
		grid-row: 1 / 2;
	}
	h3 {
		grid-row: 1;
		margin-top: 5px;
		border-bottom: 2px black solid;
		font-size: xx-large;
	}
	div.spellTable {
		grid-row: 2;
		display: grid;
		grid-template-columns: repeat(9, 1fr);
		grid-column: ${(props) => {
			switch (props.variant) {
				case 'Bard':
					return '8';
				case 'Cleric':
					return '5';
				case 'Druid':
					return '5';
				case 'Sorcerer':
					return '8';
				case 'Wizard':
					return '5';
				default:
					return 'none';
			}
		}};
	}
	div.halfSpellTable {
		grid-row: 2;
		display: grid;
		grid-template-columns: repeat(5, 1fr);
		grid-column: ${(props) => {
			switch (props.variant) {
				case 'Paladin':
					return '4';
				case 'Ranger':
					return '5';
				default:
					return 'none';
			}
		}};
	}
`;
export const TableGrid = styled.div`
	display: grid;
	grid-row: 2;
	grid-auto-rows: repeat(20, 40px);
	grid-template-columns: 1fr;
	text-align: center;
`;

export const TableRow = styled.div`
	display: grid;
	border-bottom: 2px black solid;
	text-align: center;
	padding-top: 5px;
	grid-row: ${(props) => props.level};
	grid-template-columns: ${(props) => {
		switch (props.variant) {
			case 'Barbarian':
				return '1fr 1fr 2fr 1fr 1fr';
			case 'Bard':
				return '1fr 1fr 2fr 1fr 1fr 1fr 1fr repeat(9, 1fr)';
			case 'Cleric':
				return '1fr 1fr 2.5fr 1fr repeat(9, .5fr)';
			case 'Druid':
				return '1fr 1fr 2fr 1fr repeat(9, 1fr)';
			case 'Fighter':
				return '1fr 1fr 3fr 1fr 1fr 1fr';
			case 'Monk':
				return '1fr 1fr 4fr 1fr 1fr 1fr';
			case 'Paladin':
				return '1fr 1fr 3fr repeat(5, 0.4fr)';
			case 'Ranger':
				return '1fr 1fr 3fr 1fr repeat(5, 0.4fr)';
			case 'Rogue':
				return '1fr 1fr 3fr 1fr';
			case 'Sorcerer':
				return '1fr 1fr 3fr 1fr 1fr 1fr 1fr repeat(9, 1fr)';
			case 'Warlock':
				return '1fr 1fr 3fr 1fr 1fr 1fr 1fr 1fr';
			case 'Wizard':
				return '1.5fr 1.5fr 4.5fr 1.5fr repeat(9, 1fr)';
			default:
				return 'none';
		}
	}};

	:hover {
		background-color: gold;
	}
`;
