import { RECEIVE_SINGLE_POKEMON } from '../actions/pokemon_actions';


const pokemonDetailReducer = (state = {}, action) => {
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return action.pokemonDetail;
    default:
      return state;
  }
};

export default pokemonDetailReducer;
