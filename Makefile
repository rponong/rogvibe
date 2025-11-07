.PHONY: check format lint clean help

# 默认目标
all: check

check:
	@echo "Running ruff check..."
	ruff check .
	@echo "Running black..."
	black .

lint:
	@echo "Running ruff check..."
	ruff check .

format:
	@echo "Running black..."
	black .

clean:
	@echo "Cleaning cache files..."
	find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} + 2>/dev/null || true

help:
	@echo "Available targets:"
	@echo "  make          - Run ruff check and black (default)"
	@echo "  make check    - Run ruff check and black"
	@echo "  make lint     - Run ruff check only"
	@echo "  make format   - Run black only"
	@echo "  make clean    - Clean cache files"
	@echo "  make help     - Show this help message"
