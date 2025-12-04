from scripts.forklift import Forklift
from scripts.warehouse import Warehouse

def read_warehouse(path):
    with open(path, "r") as f:
        return [list(line.rstrip("\n")) for line in f]

def print_warehouse(warehouse):
    for row in warehouse:
        print(''.join(row))

def run_once(grid):
    warehouse = Warehouse(grid)
    forklift = Forklift()
    removed_count = 0
    neighbors_count_map = warehouse.create_neighbor_count_map()
    for row_index in range(warehouse.rows()):
        for col_index in range(warehouse.cols()):
            removed = forklift.lift(warehouse.get_grid(), (col_index, row_index), neighbors_count_map)
            if removed:
                removed_count += 1
    return removed_count

def run_until_no_tp_is_accessible(grid):
    total_removed = 0
    while True:
        removed_this_round = run_once(grid)
        if removed_this_round == 0:
            break
        total_removed += removed_this_round
    return total_removed

def main():
    grid = read_warehouse("input.txt")
    total_removed = run_until_no_tp_is_accessible(grid)
    print(f"Total removed: {total_removed}")

if __name__ == "__main__":
    main()
