import { Fragment, useContext, useEffect } from 'react';
import { Routes, Route, useNavigate } from 'react-router-dom';
import GlobalStyles from './GlobalStyles';
import { ContentWrapper, PageWrapper } from './styles';
import { CharacterProvider, UserContext, DiceProvider } from './hookComponents';
import { StatTestSheet } from './StatTestSheet';
import * as AllChar from './characterComponents';
import * as AllUtil from './utilityComponents';
import * as AllInfo from './gameInfoComponents';

export const App = () => {
	const { user, setUser } = useContext(UserContext);

	useEffect(() => {
		fetch('/me').then((r) => {
			if (r.ok) {
				r.json().then((me) => setUser(me));
			} else {
				r.json().then((errors) => console.log(errors));
			}
		});
	}, [setUser]);

	return (
		<CharacterProvider>
			<PageWrapper>
				<GlobalStyles/>
				<AllUtil.NavBar user={user} setUser={setUser}/>
				<ContentWrapper>
					<Routes>
						<Route index element={<AllUtil.Root/>}/>
						<Route path='*' element={<AllUtil.NotFound/>}/>
						<Route path='login' element={<AllUtil.Login/>}/>
						<Route path='signup' element={<AllUtil.Signup/>}/>
						<Route path='races/:race' element={<AllInfo.RaceDetail/>}/>
						<Route path='classes/:dnd_class'element={<AllInfo.DndClassDetails/>}/>
						<Route path='/users/:username' element={<AuthRoutes><AllUtil.UserPage/></AuthRoutes>}/>
						<Route path='/users/:username/characters/:id/' element={<DiceProvider><AllChar.CharacterSheet/></DiceProvider>}/>
						<Route path='/users/:username/characters/:id/edit' element={<AllChar.EditCharacter/>}/>
						<Route path='/new_character/*' element={<AuthRoutes><AllChar.CreateCharacter/></AuthRoutes>}>
							<Route path='basics' element={<AllChar.CharBasicsPage/>}/>
							<Route path='stats' element={<AllChar.CharStatsPage/>}/>
							<Route path='skills' element={<AllChar.CharSkillsPage/>}/>
							<Route path='spells' element={<AllChar.CharSpellsPage/>}/>
							<Route path='review' element={<AllChar.CharReviewPage/>}/>
						</Route>
						<Route path='test' element={<StatTestSheet/>}/>
					</Routes>
				</ContentWrapper>
			</PageWrapper>
		</CharacterProvider>
	);
};

const AuthRoutes = ({ children }) => {

	const {user} = useContext(UserContext)

	const navigate = useNavigate()

	if (!user) {
		navigate('/not_found')
	}

	return <Fragment>{children}</Fragment>;
};