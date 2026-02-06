from bulletin_parser import BulletinParser
from bulletin_scraper import BulletinScraper

from misc.constants import DROM_BASE_URL, REGIONS

import argparse

argparser = argparse.ArgumentParser(description="Bulletin parser")
argparser.add_argument('--region', type=str, default=None, choices=REGIONS.keys())
argparser.add_argument('--start_page', type=int, default=None)
argparser.add_argument('--verbose', action='store_true')
argparser.add_argument('--mode', type=str, default='live', choices=['live', 'historical'])

def main():

    args = argparser.parse_args()

    parser = BulletinParser(url=DROM_BASE_URL + REGIONS[args.region], verbose=args.verbose)
    scraper = BulletinScraper(parser=parser, verbose=args.verbose, mode=args.mode)

    scraper.start(args.start_page)
        

if __name__ == "__main__":
    main()