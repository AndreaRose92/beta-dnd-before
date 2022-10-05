import styled from 'styled-components';

export const FormGrid = styled.div`
     display: grid;
     grid-template-columns: 100px 1fr 3fr 1fr 100px;
     grid-template-rows: 60px 60px 1fr 1fr;
     justify-content: center;

     h1 {
          grid-column: 3;
          grid-row: 1;
          text-align: center;
     }

     .navButtons {
        grid-column: 3;
        grid-row: 2;
        display: block;
        justify-self: center;
        margin-top: 10px;
     }
`;

export const FormBox = styled.form`
	grid-column: 3;
	grid-row: 3;
	justify-self: center;
	text-align: center;
	height: 200px;

	h2,
	input,
	select,
	button {
		margin: 5px;
		display: block;
	}
`;

export const LevelDetail = styled.div`
	grid-column: 3;
	grid-row: 4;
	justify-self: center;
	text-align: center;
	background-color: beige;
	border-radius: 5px;
	height: 200px;
	width: 60%;
	overflow-y: auto;

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

	h2 {
		margin: 25px;
	}

	h3 {
		margin-left: 40px;
		margin-right: 40px;
	}
`;

export const LevelBox = styled.form`
	grid-column: 3;
	grid-row: 3;
	justify-self: center;
	text-align: center;
	height: 200px;
     width: 100vh;
     margin-bottom: 25px;
     display: grid;
     grid-template-columns: 1fr 1fr;
     grid-template-rows: 40px 1fr;
     row-gap: 5px;

     h2 {
          margin: 5px;
     }

`;

export const ButtonBox = styled.div`
     grid-column: 1;
     grid-row: 2;
     text-align: center;
     display: grid;
     overflow-y: auto;
	 justify-self: center;
	 border: 2px black solid;
	 width: 60%;
	 border-radius: 5px;
	 background-color: ${props => {
        switch (props.variant) {
            case 'Barbarian': return '#B87333';
            case 'Bard': return '#B990BA';
            case 'Cleric': return '#AAABAD';
            case 'Druid': return '#8A9453';
            case 'Fighter': return '#674A37';
            case 'Monk': return '#6DB7D5';
            case 'Paladin': return '#B49E53';
            case 'Ranger': return '#4E8062';
            case 'Rogue': return '#4A4B45';
            case 'Sorcerer': return '#C1525B';
            case 'Warlock': return '#8253B1';
            case 'Wizard': return '#2C5EB5';
            default: return 'gray'
        }
    }};

	::-webkit-scrollbar {
		background-color: #141511;
		width: 4px;
	}

	::-webkit-scrollbar-track {
		background: #aaa9ad;
		width: 4px;
	}

	::-webkit-scrollbar-thumb {
		background: radial-gradient(
			farthest-corner at 0px 0px,
			#fff 0%,
			#d4af37 100%
		);
		border: 2px ridge #d4af37;
	}

     button {
          justify-self: center;
          align-self: center;
          width: 100px;
          margin-top: 4px;
     }


`


export const TabSelect = styled.button`
	background-color: ${(props) => (props.active ? 'green' : null)};
`;
