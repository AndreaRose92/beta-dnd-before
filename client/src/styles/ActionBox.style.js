import styled from 'styled-components';

export const SpellTable = styled.div`
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: 40px 1fr;
	text-align: center;
`;

export const SpellHeader = styled.div`
	grid-row: 1;
	display: grid;
	grid-template-columns: 3fr 1fr 1fr 1fr 2fr 3fr;
`;

export const SpellGrid = styled.div`
	grid-row: 2;
	text-align: center;
	display: grid;
	overflow-y: auto;
	height: 250px;
	::-webkit-scrollbar {
		background-color: #141511;
	}

	::-webkit-scrollbar-track {
		background: #aaa9ad;
	}

	::-webkit-scrollbar-thumb {
		background: radial-gradient(
			farthest-corner at 0px 0px,
			#fff 0%,
			#d4af37 100%
		);
		border: 2px ridge #d4af37;
	}
`;
export const SpellRow = styled.div`
	align-items: center;
	text-align: center;
	display: grid;
	grid-template-rows: 1fr;
	grid-template-columns: 3fr 1fr 1fr 1fr 2fr 1.5fr 0.75fr 0.75fr;
`;

export const ActionTable = styled.div`
	display: grid;
	grid-template-columns: 1fr;
	grid-template-rows: 40px 1fr;
	text-align: center;
`;
export const ActionHeader = styled.div`
	grid-row: 1;
	display: grid;
	grid-template-columns: 3fr 1fr 1fr 2fr 3fr;
`;

export const ActionGrid = styled.div`
	grid-row: 2;
	text-align: center;
	display: grid;
	overflow-y: auto;
	height: 250px;
	::-webkit-scrollbar {
		background-color: #141511;
	}

	::-webkit-scrollbar-track {
		background: #aaa9ad;
	}

	::-webkit-scrollbar-thumb {
		background: radial-gradient(
			farthest-corner at 0px 0px,
			#fff 0%,
			#d4af37 100%
		);
		border: 2px ridge #d4af37;
	}
`;

export const ActionRow = styled.div`
	align-items: center;
	text-align: center;
	display: grid;
	grid-template-rows: 1fr;
	grid-template-columns: 3fr 1fr 1fr 2fr 3fr;
	height: 40px;
`;
