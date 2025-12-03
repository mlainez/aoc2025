const idValidator = require('../src/id_validator');

describe('IdValidator', () => {
  describe('valid', () => {
    it('should mark 11 as invalid', () => {
      expect(idValidator.valid(11)).toBe(false);
    });

    it('should mark 112 as valid', () => {
      expect(idValidator.valid(112)).toBe(true);
    });

    it('should mark 1188511885 as invalid', () => {
      expect(idValidator.valid(1188511885)).toBe(false);
    });

    it('should mark 111 as invalid', () => {
      expect(idValidator.valid(111)).toBe(false);
    });

    it('should mark 999 as invalid', () => {
      expect(idValidator.valid(999)).toBe(false);
    });
  });

  describe('extractRange', () => {
    it('should extract range from "111111-222222"', () => {
      const range = idValidator.extractRange("111111-222222");
      expect(range.start).toBe(111111);
      expect(range.end).toBe(222222);
    });

    it('should extract range from "38593856-38593862"', () => {
      const range = idValidator.extractRange("38593856-38593862");
      expect(range.start).toBe(38593856);
      expect(range.end).toBe(38593862);
    });
  });

  describe('extractInvalidIdsFromRange', () => {
    it('should extract 11 and 22 as invalid IDs from range 11-22', () => {
      const range = { start: 11, end: 22 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([11, 22]);
    });

    it('should extract 99 and 111 as invalid IDs from range 95-115', () => {
      const range = { start: 95, end: 115 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([99, 111]);
    });

    it('should extract 38593859 as invalid IDs from range 38593856-38593862', () => {
      const range = { start: 38593856, end: 38593862 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([38593859]);
    });

    it('should extract 565656 as invalid ID from range 565653-565659', () => {
      const range = { start: 565653, end: 565659 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([565656]);
    });

    it('should extract 824824824 as invalid ID from range 824824821-824824827', () => {
      const range = { start: 824824821, end: 824824827 };
      const invalidIds = idValidator.extractInvalidIdsFromRange(range);
      expect(invalidIds).toEqual([824824824]);
    });
  });
});
