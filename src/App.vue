<template lang="html">
  <div class="main">
    <h1> CarcaCodeClan </h1>
    <board :boardState="boardState"/>
    <next-tile-area/>
    <scoreboard/>
  </div>
</template>

<script>
import Board from './components/Board.vue'
import NextTileArea from './components/NextTileArea.vue'
import Scoreboard from './components/Scoreboard.vue'

export default {
  name: "app",
  data(){
    return {
      boardState: Array(121).fill("")
    }
  },
  components: {
    'board': Board,
    'next-tile-area': NextTileArea,
    'scoreboard': Scoreboard
  }
}
</script>

<style lang="css" scoped>

</style>
