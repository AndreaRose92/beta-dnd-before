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
	text-align: center;
	grid-template-columns: 2.35fr 1.65fr 1fr 1fr 1.75fr 1.75fr 1.5fr;
	margin-right: 10px;
	border-bottom: 4px double darkgrey;
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
	grid-template-rows: 30px;
	grid-template-columns: 2.35fr 1.65fr 1fr 1fr 2fr 1.5fr 0.75fr 0.75fr;
	border-bottom: 2px dashed darkgray;

	:hover {
		background-color: aliceblue;
	}

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
	grid-template-columns: 2.5fr 1.5fr 1fr 2fr 3fr;
	border-bottom: 4px double darkgrey;
`;

export const ActionGrid = styled.div`
	grid-row: 2;
	text-align: center;
	display: grid;
	grid-template-rows: ${props => {return `repeat(${props.length}, 40px)`}};
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
	justify-items: center;
	text-align: center;
	display: grid;
	margin-top: 10px;
	border-bottom: 2px dashed darkgray;
	grid-template-columns: 2.5fr 1.5fr 1fr 2fr 3fr;
`;

export const FeatureTable = styled.div`
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

export const FeatureRow = styled.div`
	margin-left: 4px;
	display: grid;
	grid-template-rows: .3fr 1fr 3px;
	border-bottom: 1.8px dashed darkgray;

	h4 {
		text-align: left;
		margin-bottom: 4px;
	}

	p {
		text-align: left;
		font-size: small;
	}
`;
