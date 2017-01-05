import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.requestAllPokemon();
  }

  render() {
    const pokemonItems = this.props.pokemon.map(pokemon =>
      <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />
    );

    return(
      <div>
        <ul className="pokemon-list">
          { pokemonItems }
        </ul>
      </div>
    );

  }
}



export default PokemonIndex;
