"""
Debugging MeTTa/Python integrated code.

This script is meant for classroom walkthroughs. It exercises the same
pipeline used by `metta-demo`:

question text -> parsed JSON -> generated MeTTa query -> normalized matches
"""

import json
import os
import sys

ROOT = os.path.dirname(os.path.dirname(__file__))
METTA_DEMO = os.path.join(ROOT, "metta-demo")

if METTA_DEMO not in sys.path:
    sys.path.insert(0, METTA_DEMO)

from src.text_to_json_parser import parse_question_to_json
from src.utils import find_by_json, json_to_metta_query


def debug_question(question, assumed_subject="Alice"):
    print("=" * 70)
    print("QUESTION:")
    print(question)

    try:
        parsed = parse_question_to_json(question, assumed_subject=assumed_subject)
        print("\nPARSED JSON:")
        print(json.dumps(parsed, indent=2))
    except Exception as error:
        print("\nPARSER ERROR:")
        print(error)
        return

    try:
        query = json_to_metta_query(parsed)
        print("\nGENERATED MeTTa QUERY:")
        print(query)
    except Exception as error:
        print("\nQUERY GENERATION ERROR:")
        print(error)
        return

    try:
        payload = find_by_json(parsed)
        print("\nNORMALIZED MATCHES:")
        print(payload["matches"])
        print("\nREASONING:")
        for item in payload["explanations"]:
            print("-", item["message"])
    except Exception as error:
        print("\nSEARCH ERROR:")
        print(error)


if __name__ == "__main__":
    debug_question("Who in Alice's network is a nurse within 2 hops?")
    # debug_question("Find classmates who have the hobby Chess up to depth 2.")
    # debug_question("Is there a pilot in Alice's family network?")
    # debug_question("Who in Alice's network likes astronomy?")
